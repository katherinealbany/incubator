###################################################################################################

{{- define "elasticsearchDataName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.dataName) .Values.elasticsearchDataName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchIngestName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.ingestName) .Values.elasticsearchIngestName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMasterName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.masterName) .Values.elasticsearchMasterName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################
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

{{- define "elasticsearchImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.elasticsearchImage -}}
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

{{- define "elasticsearchTransportName" -}}
{{- $holding := default (printf "%s-%s" (include "elasticsearchName" .) .Values.transportName) .Values.elasticsearchTransportName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchConfigMountBase" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.configName) .Values.elasticsearchConfigMountBase -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchVolumeDataMount" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.volumeDataName) .Values.elasticsearchVolumeDataMount -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchVolumeLogsMount" -}}
{{- default (printf "%s/%s" .Values.volumeMountBase .Values.volumeLogsName) .Values.elasticsearchVolumeLogsMount -}}
{{- end -}}

###################################################################################################

{{- define "elasticsearchMinimumMasterNodes" -}}
{{- default (int (add (div .Values.replicas 2) 1)) .Values.elasticsearchMinimumMasterNodes -}}
{{- end -}}

###################################################################################################
