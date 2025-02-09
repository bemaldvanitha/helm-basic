{{- define "templating-deep-dive.fullname" -}}
{{- $fullName := printf "%s-%s" .Release.Name .Chart.Name }}

# {{- if .Values.customName }}
# {{- $fullName = .Values.customName }}
# {{- end}}

{{- $fullName | trunc 63 | trimSuffix "-"  -}}
{{- end -}}

{{- define "templating-deep-dive.selectorLabels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
managedBy: "helm"
{{- end -}}