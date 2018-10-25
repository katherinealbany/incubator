package net.kalbany;

import java.util.List;
import java.util.Iterator;

import java.io.IOException;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;

import com.amazonaws.services.sqs.model.Message;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Nexus {

   private static final Logger logger = LogManager.getLogger(Nexus.class);

   public static void main (String[] args) {
      final AmazonSQS sqs = AmazonSQSClientBuilder.defaultClient();

      try {
         final String url = sqs.getQueueUrl("s3-events-travisperkins-logging-ccoe-cloudtrail").getQueueUrl();
         final ObjectMapper objectMapper = new ObjectMapper();

         do {
            List<Message> messages = sqs.receiveMessage(url).getMessages();

            for (Message m : messages) {
               logger.debug("----- rootNode");
               JsonNode rootNode = objectMapper.readTree(m.getBody());
               logger.debug(rootNode.toString());

               logger.debug("----- recordsNode");
               JsonNode recordsNode = rootNode.path("Records");
               logger.debug(recordsNode.toString());

               Iterator<JsonNode> elements = recordsNode.elements();
               while (elements.hasNext()) {
                  JsonNode element = elements.next();

                  logger.debug("----- s3Node");
                  JsonNode s3Node = element.path("s3");
                  logger.debug(s3Node.toString());

                  logger.debug("----- object");
                  JsonNode objectNode = s3Node.path("object");
                  logger.debug(objectNode.toString());

                  logger.debug("----- key");
                  JsonNode keyNode = objectNode.path("key");
                  logger.info(keyNode.asText());
               }

               sqs.deleteMessage(url, m.getReceiptHandle());
            }
         }
         while (true);
      }
      catch (IOException ex) {
         logger.error(ex.getMessage(), ex);
      }
      finally {
         sqs.shutdown();
      }
   }

}
