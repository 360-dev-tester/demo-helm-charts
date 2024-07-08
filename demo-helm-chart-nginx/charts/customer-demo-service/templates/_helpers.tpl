{{- define "customer-demo-service.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "customer-demo-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}

{{- define "customer-demo-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{- define "customer-demo-service.labels" -}}
helm.sh/chart: {{ include "customer-demo-service.chart" . }}
{{ include "customer-demo-service.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "customer-demo-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "customer-demo-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
