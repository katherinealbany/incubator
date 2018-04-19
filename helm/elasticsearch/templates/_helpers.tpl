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

{{- define "elasticsearchImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.elasticsearchImage -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchRelease" -}}
{{- default .Release.Name .Values.elasticsearchRelease -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchDataName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.dataWord) .Values.elasticsearchDataName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
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

{{- define "elasticsearchIngestName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.ingestWord) .Values.elasticsearchIngestName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMasterName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.masterWord) .Values.elasticsearchMasterName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchClusterName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.clusterWord) .Values.elasticsearchClusterName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchConfigMountBase" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.configWord) .Values.elasticsearchConfigMountBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchVolumeDataMount" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.dataWord) .Values.elasticsearchVolumeDataMount -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchVolumeLogsMount" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.logsWord) .Values.elasticsearchVolumeLogsMount -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMinimumMasterNodes" -}}
{{- default (int (add (div .Values.masterReplicas 2) 1)) .Values.elasticsearchMinimumMasterNodes -}}
{{- end -}}

###################################################################################################
