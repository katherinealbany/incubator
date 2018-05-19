###################################################################################################

{{- define "filebeatName" -}}
{{- $holding := default (printf "%s-%s" (include "filebeatRelease" .) .Chart.Name) .Values.filebeatName -}}
{{- $holding | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###################################################################################################

{{- define "filebeatChart" -}}
{{- default (printf "%s-%s" .Chart.Name .Chart.Version) .Values.filebeatChart -}}
{{- end -}}

###################################################################################################

{{- define "filebeatImage" -}}
{{- default (printf "%s:%s" .Values.imageName .Values.imageTag) .Values.filebeatImage -}}
{{- end -}}

###################################################################################################

{{- define "filebeatRelease" -}}
{{- default .Release.Name .Values.filebeatRelease -}}
{{- end -}}

###################################################################################################

{{- define "filebeatHeritage" -}}
{{- default .Release.Service .Values.filebeatHeritage -}}
{{- end -}}

###################################################################################################

{{- define "filebeatNamespace" -}}
{{- default .Release.Namespace .Values.filebeatNamespace -}}
{{- end -}}

###################################################################################################
