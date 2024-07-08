{{- define "employee-service.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "employee-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}

{{- define "employee-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "employee-service.labels" -}}
helm.sh/chart: {{ include "employee-service.chart" . }}
{{ include "employee-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "employee-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "employee-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
