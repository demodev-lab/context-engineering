# Context Engineering

## 기반 문서

- [.cursor](https://github.com/demodev-lab/.cursor)
- [.claude](https://github.com/demodev-lab/.claude)
- [PRPs](https://github.com/demodev-lab/PRPs)

## 설치하기

### 스크립트로 설치하기

**macOS/Linux:**

```bash
curl -fsSL https://raw.githubusercontent.com/demodev-lab/context-engineering/main/install.sh | bash
claude /init
```

**Windows PowerShell:**

```powershell
iwr -useb https://raw.githubusercontent.com/demodev-lab/context-engineering/main/install.ps1 | iex
claude /init
```

Claude Code 상에서 `!`를 눌러 쉘 모드에 진입하고 `npx rules-converter claude` 명령어를 실행해주세요.

### 수동 설치

<details>
<summary>수동 설치 명령어 보기</summary>

**macOS/Linux:**

```shell
mkdir archive
mv .cursor archive/
mv .claude archive/
mv .gemini archive/

git clone https://github.com/demodev-lab/.cursor && /bin/rm -rf .cursor/.git
git clone https://github.com/demodev-lab/.claude && /bin/rm -rf .claude/.git
git clone https://github.com/demodev-lab/PRPs && /bin/rm -rf PRPs/.git

claude -p /init
npx rules-converter claude
```

**Windows PowerShell:**

```powershell
mkdir archive
Move-Item .cursor archive/
Move-Item .claude archive/
Move-Item .gemini archive/

git clone https://github.com/demodev-lab/.cursor; Remove-Item -Recurse -Force .cursor\.git
git clone https://github.com/demodev-lab/.claude; Remove-Item -Recurse -Force .claude\.git
git clone https://github.com/demodev-lab/PRPs; Remove-Item -Recurse -Force PRPs\.git

claude -p /init
npx rules-converter claude
```

</details>

## 참고 문서

- [A Survey of Context Engineering for Large Language Models](https://arxiv.org/abs/2507.13334)
- [LangChain: Context Engineering](https://blog.langchain.com/context-engineering-for-agents/)
