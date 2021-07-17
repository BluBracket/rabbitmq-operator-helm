{{/*
Expand the name of the chart.
*/}}
{{- define "rabbitmqClusterOperator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rabbitmqClusterOperator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rabbitmqClusterOperator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rabbitmqClusterOperator.labels" -}}
helm.sh/chart: {{ include "rabbitmqClusterOperator.chart" . }}
{{ include "rabbitmqClusterOperator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rabbitmqClusterOperator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rabbitmqClusterOperator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rabbitmqClusterOperator.serviceAccountName" -}}
{{- default (include "rabbitmqClusterOperator.name" .) .Values.serviceAccount.nameOverride }}
{{- end }}

{{/*
Create the name of the role to use
*/}}
{{- define "rabbitmqClusterOperator.roleName" -}}
{{- include "rabbitmqClusterOperator.name" . }}-leader-election-role
{{- end }}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "rabbitmqClusterOperator.clusterRoleName" -}}
{{- include "rabbitmqClusterOperator.name" . }}-role
{{- end }}
