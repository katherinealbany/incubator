###################################################################################################

{{- define "administratorName" -}}
{{- $holding := default (printf "%s-%s" (include "administratorRelease" .) .Chart.Name) .Values.administratorName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "administratorChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.administratorChart -}}
{{- end -}}

###################################################################################################

{{- define "administratorImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.administratorImage -}}
{{- end -}}

###################################################################################################

{{- define "administratorRelease" -}}
{{- default .Release.Name .Values.administratorRelease -}}
{{- end -}}

###################################################################################################

{{- define "administratorHeritage" -}}
{{- default .Release.Service .Values.administratorHeritage -}}
{{- end -}}

###################################################################################################

{{- define "administratorNamespace" -}}
{{- default .Release.Namespace .Values.administratorNamespace -}}
{{- end -}}

###################################################################################################
