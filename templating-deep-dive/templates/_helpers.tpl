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

{{- define "templating-deep-dive.validators.service" -}}
{{- $sanitizedPort := int .port -}}
    {{- if or (lt $sanitizedPort 1) (gt $sanitizedPort 65535) -}}
        {{- fail "error: port should be between 1 - 65535" -}}
    {{- end -}}
{{- end -}}