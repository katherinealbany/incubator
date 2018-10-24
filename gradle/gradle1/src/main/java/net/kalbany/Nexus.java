package net.kalbany;

import java.util.List;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;

import com.amazonaws.services.sqs.model.Message;

public class Nexus {

   private static final Logger logger = LogManager.getLogger(Nexus.class);

   public static void main (String[] args) {
      final AmazonSQS sqs = AmazonSQSClientBuilder.defaultClient();

      try {
         final String url = sqs.getQueueUrl("s3-events-travisperkins-logging-ccoe-cloudtrail").getQueueUrl();

         do {
            List<Message> messages = sqs.receiveMessage(url).getMessages();

            for (Message m : messages) {
               logger.info(m.getBody());
               sqs.deleteMessage(url, m.getReceiptHandle());
            }
         }
         while (true);
      }
      finally {
         sqs.shutdown();
      }
   }

}
