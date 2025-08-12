@'
# Exit 125 to skip, 0 good, 1 bad
if (-Not (Test-Path -Path "feature.txt")) { exit 125 }

$content = Get-Content -Raw -Path "feature.txt"
if ($content -match "BUG") {
  exit 1  # bad
} else {
  exit 0  # good
}
'@ | Out-File -Encoding UTF8 bisect-test.ps1
git add bisect-test.ps1 bisect-test.sh
git commit -m "chore: add bisect test scripts"
