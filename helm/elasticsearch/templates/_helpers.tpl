###################################################################################################
###################################################################################################

{{- define "elasticsearchName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchRelease" .) .Chart.Name) .Values.elasticsearchName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.elasticsearchChart -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchRelease" -}}
{{- default .Release.Name .Values.elasticsearchRelease -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchHeritage" -}}
{{- default .Release.Service .Values.elasticsearchHeritage -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchNamespace" -}}
{{- default .Release.Namespace .Values.elasticsearchNamespace -}}
{{- end -}}

###################################################################################################
###################################################################################################

{{- define "elasticsearchClusterName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.clusterWord) .Values.elasticsearchClusterName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchClusterImage" -}}
{{- default (printf "%s:%s" .Values.clusterImageName .Values.clusterImageTag) .Values.elasticsearchClusterImage -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchConfigMountBase" -}}
{{- default (printf "%s/%s" .Values.configMountBase .Values.configWord) .Values.elasticsearchConfigMountBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMinimumMasterNodes" -}}
{{- default (int (add (div .Values.masterReplicas 2) 1)) .Values.elasticsearchMinimumMasterNodes -}}
{{- end -}}

###################################################################################################
###################################################################################################

{{- define "elasticsearchDataName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.dataWord) .Values.elasticsearchDataName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchDataDataBase" -}}
{{- default (printf "%s/%s" .Values.dataVolumeMountBase .Values.dataWord) .Values.elasticsearchDataDataBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchDataLogsBase" -}}
{{- default (printf "%s/%s" .Values.dataVolumeMountBase .Values.logsWord) .Values.elasticsearchDataLogsBase -}}
{{- end -}}

###################################################################################################
###################################################################################################

{{- define "elasticsearchIngestName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.ingestWord) .Values.elasticsearchIngestName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchIngestDataBase" -}}
{{- default (printf "%s/%s" .Values.ingestVolumeMountBase .Values.dataWord) .Values.elasticsearchIngestDataBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchIngestLogsBase" -}}
{{- default (printf "%s/%s" .Values.ingestVolumeMountBase .Values.logsWord) .Values.elasticsearchIngestLogsBase -}}
{{- end -}}

###################################################################################################
###################################################################################################

{{- define "elasticsearchMasterName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.masterWord) .Values.elasticsearchMasterName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMasterDataBase" -}}
{{- default (printf "%s/%s" .Values.masterVolumeMountBase .Values.dataWord) .Values.elasticsearchMasterDataBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMasterLogsBase" -}}
{{- default (printf "%s/%s" .Values.masterVolumeMountBase .Values.logsWord) .Values.elasticsearchMasterLogsBase -}}
{{- end -}}

###################################################################################################
###################################################################################################
