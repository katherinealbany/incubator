###################################################################################################

{{- define "XXXXName" -}}
{{- $holding := default (printf "%s-%s" (include "XXXXRelease" .) .Chart.Name) .Values.XXXXName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "XXXXChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.XXXXChart -}}
{{- end -}}

###################################################################################################

{{- define "XXXXImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.XXXXImage -}}
{{- end -}}

###################################################################################################

{{- define "XXXXRelease" -}}
{{- default .Release.Name .Values.XXXXRelease -}}
{{- end -}}

###################################################################################################

{{- define "XXXXHeritage" -}}
{{- default .Release.Service .Values.XXXXHeritage -}}
{{- end -}}

###################################################################################################

{{- define "XXXXNamespace" -}}
{{- default .Release.Namespace .Values.XXXXNamespace -}}
{{- end -}}

###################################################################################################
