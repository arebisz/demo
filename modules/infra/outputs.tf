output "project_number" {
  value = data.google_project.project.number
}

output "snow_topic_id" {
  value = google_pubsub_topic.pubsub_snow_topic.id
}
