{{- define "common.labels" -}}
helm.sh/chart: {{ .Chart.Name | quote }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- with .Values.labels }}
    {{- range $k, $v := . }}
      {{- $name := $k }}
      {{- $value := tpl $v $ }}
{{ $name }}: {{ quote $value }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/* Selector labels shared across objects */}}
{{- define "common.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
