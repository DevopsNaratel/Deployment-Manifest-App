{{/* Nama dasar: app_name-app_id */}}
{{- define "base-chart.name" -}}
{{- printf "%s-%s" .Values.app.name .Values.app.id | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Label standar */}}
{{- define "base-chart.labels" -}}
app.kubernetes.io/id: {{ .Values.app.id | quote }}
app.kubernetes.io/name: {{ .Values.app.name | quote }}
app.kubernetes.io/env: {{ .Values.app.env | quote }}
{{- end -}}
