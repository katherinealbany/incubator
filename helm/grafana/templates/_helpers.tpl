###################################################################################################

{{- define "grafanaName" -}}
{{- $holding := default (printf "%s-%s" (include "grafanaRelease" .) .Chart.Name) .Values.grafanaName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "grafanaChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.grafanaChart -}}
{{- end -}}

###################################################################################################

{{- define "grafanaImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.grafanaImage -}}
{{- end -}}

###################################################################################################

{{- define "grafanaRelease" -}}
{{- default .Release.Name .Values.grafanaRelease -}}
{{- end -}}

###################################################################################################

{{- define "grafanaHeritage" -}}
{{- default .Release.Service .Values.grafanaHeritage -}}
{{- end -}}

###################################################################################################

{{- define "grafanaNamespace" -}}
{{- default .Release.Namespace .Values.grafanaNamespace -}}
{{- end -}}

###################################################################################################
