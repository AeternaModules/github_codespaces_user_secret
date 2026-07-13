variable "codespaces_user_secrets" {
  description = <<EOT
Map of codespaces_user_secrets, attributes below
Required:
    - secret_name
Optional:
    - encrypted_value
    - plaintext_value
    - selected_repository_ids
EOT

  type = map(object({
    secret_name             = string
    encrypted_value         = optional(string)
    plaintext_value         = optional(string)
    selected_repository_ids = optional(set(number))
  }))
  validation {
    condition = alltrue([
      for k, v in var.codespaces_user_secrets : (
        v.encrypted_value == null || (can(base64decode(v.encrypted_value)))
      )
    ])
    error_message = "must be valid base64"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

