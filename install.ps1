# Context Engineering 설치 스크립트 - Windows PowerShell
# https://github.com/demodev-lab/context-engineering

# 에러 발생 시 스크립트 중단
$ErrorActionPreference = "Stop"

Write-Host "Context Engineering 설치를 시작합니다..." -ForegroundColor Green

# 기존 디렉토리가 있으면 백업
$needsArchive = (Test-Path ".cursor") -or (Test-Path ".claude") -or (Test-Path ".gemini")

if ($needsArchive) {
    Write-Host "기존 설정 파일들을 백업합니다..." -ForegroundColor Yellow

    if (-not (Test-Path "archive")) {
        New-Item -ItemType Directory -Name "archive" | Out-Null
    }

    if (Test-Path ".cursor") {
        Move-Item ".cursor" "archive/" -Force
        Write-Host "  ✓ .cursor 백업 완료" -ForegroundColor Green
    }

    if (Test-Path ".claude") {
        Move-Item ".claude" "archive/" -Force
        Write-Host "  ✓ .claude 백업 완료" -ForegroundColor Green
    }

    if (Test-Path ".gemini") {
        Move-Item ".gemini" "archive/" -Force
        Write-Host "  ✓ .gemini 백업 완료" -ForegroundColor Green
    }
}

# 저장소 클론
Write-Host "최신 설정 파일들을 다운로드합니다..." -ForegroundColor Cyan

Write-Host "  .cursor 다운로드 중..." -ForegroundColor Gray
git clone https://github.com/demodev-lab/.cursor --quiet
if (Test-Path ".cursor\.git") {
    Remove-Item -Recurse -Force ".cursor\.git"
}
Write-Host "  ✓ .cursor 설치 완료" -ForegroundColor Green

Write-Host "  .claude 다운로드 중..." -ForegroundColor Gray
git clone https://github.com/demodev-lab/.claude --quiet
if (Test-Path ".claude\.git") {
    Remove-Item -Recurse -Force ".claude\.git"
}
Write-Host "  ✓ .claude 설치 완료" -ForegroundColor Green

Write-Host "  PRPs 다운로드 중..." -ForegroundColor Gray
git clone https://github.com/demodev-lab/PRPs --quiet
if (Test-Path "PRPs\.git") {
    Remove-Item -Recurse -Force "PRPs\.git"
}
Write-Host "  ✓ PRPs 설치 완료" -ForegroundColor Green

Write-Host "  .mcp.json 다운로드 중..." -ForegroundColor Gray
Invoke-WebRequest -Uri https://raw.githubusercontent.com/demodev-lab/context-engineering/main/.mcp.json -OutFile .mcp.json
Write-Host "  ✓ .mcp.json 설치 완료" -ForegroundColor Green

Write-Host ""
Write-Host "Context Engineering 설치가 완료되었습니다!" -ForegroundColor Green
Write-Host ""
Write-Host "설치된 문서:" -ForegroundColor Cyan
Write-Host "  - .cursor: https://github.com/demodev-lab/.cursor" -ForegroundColor White
Write-Host "  - .claude: https://github.com/demodev-lab/.claude" -ForegroundColor White
Write-Host "  - PRPs: https://github.com/demodev-lab/PRPs" -ForegroundColor White
Write-Host ""
Write-Host "더 알아보기:" -ForegroundColor Cyan
Write-Host "  - A Survey of Context Engineering: https://arxiv.org/abs/2507.13334" -ForegroundColor White
Write-Host "  - LangChain Context Engineering: https://blog.langchain.com/context-engineering-for-agents/" -ForegroundColor White
