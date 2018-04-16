###################################################################################################

{{- define "elasticsearchName" -}}
{{- $holding := default (printf "%s-%s" .Release.Name .Chart.Name) .Values.elasticsearchName -}}
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
