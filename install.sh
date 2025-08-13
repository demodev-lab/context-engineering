#!/bin/bash

# Context Engineering 설치 스크립트 - Linux/macOS
# https://github.com/demodev-lab/context-engineering

set -e

echo "Context Engineering 설치를 시작합니다..."

# 기존 디렉토리가 있으면 백업
if [ -d ".cursor" ] || [ -d ".claude" ] || [ -d ".gemini" ]; then
    echo "📁 기존 설정 파일들을 백업합니다..."
    mkdir -p archive

    [ -d ".cursor" ] && mv .cursor archive/ && echo "  ✓ .cursor 백업 완료"
    [ -d ".claude" ] && mv .claude archive/ && echo "  ✓ .claude 백업 완료"
    [ -d ".gemini" ] && mv .gemini archive/ && echo "  ✓ .gemini 백업 완료"
fi

# 저장소 클론
echo "최신 설정 파일들을 다운로드합니다..."

echo "    .cursor 다운로드 중..."
git clone https://github.com/demodev-lab/.cursor --quiet
/bin/rm -rf .cursor/.git
echo "  ✓ .cursor 설치 완료"

echo "    .claude 다운로드 중..."
git clone https://github.com/demodev-lab/.claude --quiet
/bin/rm -rf .claude/.git
echo "  ✓ .claude 설치 완료"

echo "    PRPs 다운로드 중..."
git clone https://github.com/demodev-lab/PRPs --quiet
/bin/rm -rf PRPs/.git
echo "  ✓ PRPs 설치 완료"

echo "    .mcp.json 다운로드 중..."
curl -fsSL https://raw.githubusercontent.com/demodev-lab/context-engineering/main/.mcp.json -o .mcp.json
echo "  ✓ .mcp.json 설치 완료"

echo ""
echo "Context Engineering 설치가 완료되었습니다!"
echo ""
echo "설치된 문서:"
echo "  - .cursor: https://github.com/demodev-lab/.cursor"
echo "  - .claude: https://github.com/demodev-lab/.claude"
echo "  - PRPs: https://github.com/demodev-lab/PRPs"
echo ""
echo "더 알아보기:"
echo "  - A Survey of Context Engineering: https://arxiv.org/abs/2507.13334"
echo "  - LangChain Context Engineering: https://blog.langchain.com/context-engineering-for-agents/"
