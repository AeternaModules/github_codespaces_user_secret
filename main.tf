resource "github_codespaces_user_secret" "codespaces_user_secrets" {
  for_each = var.codespaces_user_secrets

  secret_name             = each.value.secret_name
  encrypted_value         = each.value.encrypted_value
  plaintext_value         = each.value.plaintext_value
  selected_repository_ids = each.value.selected_repository_ids
}

