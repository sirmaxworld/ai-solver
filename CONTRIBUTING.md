# Contributing to Dual AI Tools

First off, thank you for considering contributing to Dual AI Tools! 🎉

## 📋 Contributor License Agreement (CLA)

**Important**: To maintain our dual-licensing model and protect the project's future, we require all contributors to sign our CLA. This allows us to:
- Maintain the dual AGPL/Commercial licensing
- Protect contributors and users legally
- Potentially relicense if needed for the community's benefit

[Sign the CLA here](https://cla-assistant.io/your-repo) (automated via GitHub)

## 🚀 How to Contribute

### 1. Types of Contributions We Love

- **Bug Fixes** 🐛 - Help us squash bugs
- **New AI Providers** 🤖 - Add support for Gemini, Mistral, etc.
- **Performance Improvements** ⚡ - Make it faster
- **Documentation** 📚 - Help others understand
- **Test Cases** 🧪 - Improve reliability
- **UI/UX Improvements** 🎨 - Better developer experience

### 2. Development Setup

```bash
# Fork and clone
git clone https://github.com/YOUR_USERNAME/dual-ai-tools.git
cd dual-ai-tools

# Install dependencies
npm install

# Set up environment
cp .env.example .env
# Add your API keys to .env

# Run tests
npm test

# Build
npm run build
```

### 3. Development Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

2. **Make your changes**
   - Write clean, documented code
   - Follow existing patterns
   - Add tests for new features

3. **Test thoroughly**
   ```bash
   npm test
   npm run test:integration
   ```

4. **Commit with conventional commits**
   ```bash
   git commit -m "feat: add support for Gemini AI provider"
   git commit -m "fix: handle timeout errors gracefully"
   git commit -m "docs: update API examples"
   ```

5. **Push and create PR**
   ```bash
   git push origin feature/amazing-feature
   ```

## 📝 Code Style Guidelines

### TypeScript
```typescript
// ✅ Good: Clear types, documented
/**
 * Generates solution with confidence scoring
 * @param problem - Problem description
 * @returns Solution with 0-100 confidence
 */
export async function generateSolution(
  problem: string
): Promise<Solution> {
  // Implementation
}

// ❌ Bad: No types, no docs
export async function genSol(p) {
  // Implementation
}
```

### Naming Conventions
- **Files**: `kebab-case.ts`
- **Classes**: `PascalCase`
- **Functions/Variables**: `camelCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **AI-specific**: Prefix with provider (e.g., `claudeSolution`, `gptSolution`)

### Testing
Every new feature needs tests:
```typescript
describe('DualAISolver', () => {
  it('should return high confidence for well-defined problems', async () => {
    const solution = await solver.solve('Clear problem');
    expect(solution.confidence).toBeGreaterThan(88);
  });
});
```

## 🏗️ Architecture Guidelines

### Adding a New AI Provider

1. Create provider file in `src/providers/`:
```typescript
// src/providers/gemini.ts
export class GeminiProvider implements AIProvider {
  async generateSolution(context: ProblemContext): Promise<Solution> {
    // Implementation
  }
}
```

2. Register in `src/core/provider-registry.ts`
3. Add tests in `test/providers/`
4. Update documentation

### Confidence Scoring Algorithm

The confidence scoring is core to our value proposition. Changes must:
- Maintain 0-100 scale
- Be explainable
- Be tested against our benchmark suite
- Not break existing thresholds

## 🐛 Reporting Issues

### Bug Reports
Use our [bug report template](.github/ISSUE_TEMPLATE/bug_report.md):
- Clear description
- Reproduction steps
- Expected vs actual behavior
- Environment details

### Feature Requests
Use our [feature request template](.github/ISSUE_TEMPLATE/feature_request.md):
- Problem it solves
- Proposed solution
- Alternative considered
- Additional context

## 📊 Pull Request Process

1. **PR Title**: Use conventional commit format
2. **Description**: Fill out PR template completely
3. **Tests**: All tests must pass
4. **Coverage**: Maintain >80% code coverage
5. **Review**: Requires 1 maintainer approval
6. **CLA**: Must be signed before merge

### PR Review Criteria
- ✅ Solves a real problem
- ✅ Follows architecture patterns
- ✅ Includes tests
- ✅ Updates documentation
- ✅ No breaking changes (or documented)

## 🏆 Recognition

Contributors are recognized in:
- [CONTRIBUTORS.md](CONTRIBUTORS.md) - All contributors
- README.md - Significant contributors
- Release notes - Per-release contributors

### Contribution Tiers
- 🥉 **Bronze**: 1-2 merged PRs
- 🥈 **Silver**: 3-5 merged PRs  
- 🥇 **Gold**: 6-10 merged PRs
- 💎 **Diamond**: 10+ merged PRs or major feature

## 💰 Sponsored Features

Have a feature you need for your company? We offer:
- **Sponsored Development**: We build it, everyone benefits
- **Priority Review**: Your PRs reviewed first
- **Custom Integration**: We help integrate into your stack

Contact: sponsor@your-domain.com

## 📜 License Impact

Remember:
- Your contributions are under AGPL-3.0
- Commercial users need separate license
- You retain copyright but grant us rights via CLA
- We may dual-license your contributions

## 🤝 Code of Conduct

We follow the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md):
- Be respectful
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the community

## 📞 Get Help

- **Discord**: [Join our server](https://discord.gg/your-invite)
- **Discussions**: [GitHub Discussions](https://github.com/your-repo/discussions)
- **Email**: dev@your-domain.com

## 🎯 Current Priorities

Check our [roadmap](ROADMAP.md) for current priorities:
1. 🔥 Multi-language support
2. 🔥 VS Code extension improvements
3. 🔥 Additional AI providers
4. 🔥 Performance optimizations

---

**Thank you for contributing to make AI-powered problem-solving accessible to all developers!** 🚀