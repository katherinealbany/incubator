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
