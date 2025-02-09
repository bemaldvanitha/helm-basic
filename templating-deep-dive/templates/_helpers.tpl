{{- define "templating-deep-dive.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-"  -}}
{{- end -}}