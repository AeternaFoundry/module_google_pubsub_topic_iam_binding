resource "google_pubsub_topic_iam_binding" "pubsub_topic_iam_bindings" {
  for_each = var.pubsub_topic_iam_bindings

  members = each.value.members
  role    = each.value.role
  topic   = each.value.topic
  project = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

