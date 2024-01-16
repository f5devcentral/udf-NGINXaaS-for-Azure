locals {
  protocols = toset(["http", "https"])
}

resource "local_file" "desktop_link" {
  for_each = local.protocols
  content = templatefile("${path.module}/templates/urlfile.tpl",
    {
      proto = each.key
      instance_ip = var.ip_address
    }
  )
  filename = "${pathexpand(var.desktop_path)}/${upper(each.key)}NGINXaaS Instance.desktop"
}

resource "local_file" "redirect_files" {
  for_each = local.protocols
  content = templatefile("${path.module}/templates/redirect.html.tpl",
    {
      proto = each.key
      ip_address = var.ip_address
    }
  )
  filename = "${path.root}/output/${each.key}_redirect.html"
}