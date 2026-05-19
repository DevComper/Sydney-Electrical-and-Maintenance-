$files = @('blog\ev-charger-installation-cost.html','blog\lower-electricity-bill.html')
foreach($f in $files){
  $raw = Get-Content -Path $f -Raw
  $body = $raw -replace '<script[\s\S]*?</script>',' ' -replace '<style[\s\S]*?</style>',' ' -replace '<[^>]+>',' '
  $words = ([regex]::Matches($body,'\b[\w-]+\b')).Count
  Write-Host "$f`: $words words"
}