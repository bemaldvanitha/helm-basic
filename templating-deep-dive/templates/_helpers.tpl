{{- define "templating-deep-dive.fullname" -}}
{{- $defaultName := printf "%s-%s" .Release.Name .Chart.Name }}

# {{/*- if .Values.customName }}
# {{- $fullName = .Values.customName }}
# {{- end */}}

{{- .Values.customName | default $defaultName | trunc 63 | trimSuffix "-"  -}}
{{- end -}}

{{- define "templating-deep-dive.selectorLabels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
managedBy: "helm"
{{- end -}}