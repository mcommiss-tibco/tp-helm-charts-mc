{{/* 

Copyright © 2023 - 2024. Cloud Software Group, Inc.
This file is subject to the license terms contained
in the license file that is distributed with this file.

*/}}

{{/*
    ===========================================================================
    SECTION: labels
    ===========================================================================
*/}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "dp-configure-namespace-config.shared.labels.chartLabelValue" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Selector labels used by the resources in this chart
*/}}
{{- define "dp-configure-namespace-config.shared.labels.selector" -}}
app.kubernetes.io/name: {{ include "dp-configure-namespace-config.consts.appName" . }}
app.kubernetes.io/component: {{ include "dp-configure-namespace-config.consts.component" . }}
app.kubernetes.io/part-of: {{ include "dp-configure-namespace-config.consts.team" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Standard labels added to all resources created by this chart. 
Includes labels used as selectors (i.e. template "labels.selector")
*/}}
{{- define "dp-configure-namespace-config.shared.labels.standard" -}}
{{ include  "dp-configure-namespace-config.shared.labels.selector" . }}
{{ include "dp-configure-namespace-config.shared.labels.platform" . }}
app.cloud.tibco.com/created-by: {{ include "dp-configure-namespace-config.consts.team" . }}
app.cloud.tibco.com/build-timestamp: {{ include "dp-configure-namespace-config.generated.buildTimestamp" . }}
app.cloud.tibco.com/tenant-name: {{ include "dp-configure-namespace-config.consts.tenantName" . }}
helm.sh/chart: {{ include "dp-configure-namespace-config.shared.labels.chartLabelValue" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end -}}

{{/* Platform labels to be added in all the resources created by this chart.*/}}
{{- define "dp-configure-namespace-config.shared.labels.platform" -}}
platform.tibco.com/dataplane-id: {{ .Values.global.tibco.dataPlaneId }}
platform.tibco.com/workload-type: {{ include "dp-configure-namespace-config.consts.workloadType" .}}
{{- end }}