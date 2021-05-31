{{/*
Expand the name of the chart.
*/}}
{{- define "base-webapp.name" -}}
{{- default .Values.product | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "base-webapp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "base-webapp.labels" -}}
helm.sh/chart: {{ include "base-webapp.chart" . }}
{{ include "base-webapp.selectorLabels" . }}
{{- if .Values.image.tag }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "base-webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "base-webapp.name" . }}
app.kubernetes.io/instance: {{ include "base-webapp.name" . }}
app.kubernetes.io/tribe: {{ .Values.tribe | quote }}
app.kubernetes.io/squad: {{ .Values.squad | quote }}
{{- end }}
