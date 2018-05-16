###################################################################################################

{{- define "fluentBitName" -}}
{{- $holding := default (printf "%s-%s" (include "fluentBitRelease" .) .Chart.Name) .Values.fluentBitName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "fluentBitChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.fluentBitChart -}}
{{- end -}}

###################################################################################################

{{- define "fluentBitImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.fluentBitImage -}}
{{- end -}}

###################################################################################################

{{- define "fluentBitRelease" -}}
{{- default .Release.Name .Values.fluentBitRelease -}}
{{- end -}}

###################################################################################################

{{- define "fluentBitHeritage" -}}
{{- default .Release.Service .Values.fluentBitHeritage -}}
{{- end -}}

###################################################################################################

{{- define "fluentBitNamespace" -}}
{{- default .Release.Namespace .Values.fluentBitNamespace -}}
{{- end -}}

###################################################################################################
