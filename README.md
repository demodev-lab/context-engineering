# Context Engineering

## 기반 문서

- [.cursor](https://github.com/demodev-lab/.cursor)
- [.claude](https://github.com/demodev-lab/.claude)

### 사용 방법

```shell
mkdir archive
mv .cursor archive/
mv .claude archive/
mv .gemini archive/

git clone https://github.com/demodev-lab/.cursor && /bin/rm .cursor/.git
git clone https://github.com/demodev-lab/.claude && /bin/rm .claude/.git

claude -p /init
npx rules-converter claude
```

## 참고 문서

- [A Survey of Context Engineering for Large Language Models](https://arxiv.org/abs/2507.13334)
- [LangChain: Context Engineering](https://blog.langchain.com/context-engineering-for-agents/)
