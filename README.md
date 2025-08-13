# Dual-AI Tools 🤖🤖

> A revolutionary problem-solving system that uses two AI models (Claude & GPT) to generate, evaluate, and validate solutions with confidence scoring.

[![Success Rate](https://img.shields.io/badge/Success%20Rate-100%25-success)](test-results.json)
[![Confidence Threshold](https://img.shields.io/badge/Confidence%20Threshold-88%25-blue)]()
[![Average Confidence](https://img.shields.io/badge/Avg%20Confidence-92%25-green)]()

## 🎯 What Makes This Different?

Traditional approach: Try → Fail → Try → Fail → Frustration 😤

**Dual-AI approach**: Analyze → Generate Solutions → Score Confidence → Only implement 88%+ solutions ✨

## 🚀 Quick Start

```bash
# Install globally
npm install -g @ai-tools/dual-ai-solver

# Solve a problem
ai-solve "My React component re-renders too often"

# Consult before changes
ai-consult MyComponent.tsx "Add infinite scroll"
```

## 📊 How It Works

```mermaid
graph LR
    A[Problem] --> B[Claude Solution]
    A --> C[GPT Solution]
    B --> D[Confidence Score]
    C --> D
    D --> E{Score > 88%?}
    E -->|Yes| F[✅ Implement]
    E -->|No| G[Iterate Max 5x]
    G --> B
```

## 🎨 Features

- **Dual-AI Validation**: Two different AI models cross-validate solutions
- **Confidence Scoring**: Every solution gets a 0-100% confidence score
- **88% Threshold**: Only high-confidence solutions are recommended
- **5 Iteration Max**: Systematic search without infinite loops
- **Category Support**: Optimized for CSS, React, Performance, Architecture, and Algorithm problems
- **10+ AI Models**: Choose from Claude, GPT-4, Gemini, Llama, DeepSeek, and more
- **Smart Model Routing**: Automatically selects the best model for your task type

## 💻 CLI Usage

### Problem Solving

```bash
# Basic usage
ai-solve "Flexbox items not scrolling independently"

# With context file
ai-solve "Optimize this component" --file ./MyComponent.tsx

# With specific requirements
ai-solve "Add caching" --requirements "TTL 5min,Invalidate on user change,Redis compatible"

# Output formats
ai-solve "Fix memory leak" --output json
ai-solve "Improve performance" --output markdown
```

### Code Consultation

```bash
# Review before implementing
ai-consult ./api.ts "Add rate limiting"

# Get risk assessment
ai-consult ./Component.tsx "Convert to TypeScript" --show-risks

# Check compatibility
ai-consult ./package.json "Upgrade to React 18" --check-compat
```

## 🔧 Programmatic API

```typescript
import { findHighConfidenceSolution, consultBeforeImplementing } from '@ai-tools/dual-ai-solver';

// Find solution
const solution = await findHighConfidenceSolution(
  "Component re-renders too often",
  currentCode,
  ["Must use React 18", "Maintain all functionality"]
);

if (solution.confidence > 88) {
  console.log("Implement:", solution.implementation);
} else {
  console.log("Low confidence, manual review needed");
}

// Consult before changes
const review = await consultBeforeImplementing({
  componentCode: fileContent,
  plannedChanges: "Add pagination",
  issueDescription: "List has 10000 items"
});

if (!review.willItWork) {
  console.log("Don't implement:", review.risks);
  console.log("Better approach:", review.betterApproach);
}
```

## 📈 Test Results

Our test suite shows impressive results across different problem categories:

| Category | Success Rate | Avg Confidence | Avg Time |
|----------|-------------|----------------|----------|
| CSS | 100% | 90% | 44.7s |
| React | 100% | 90% | 25.0s |
| Performance | 100% | 95% | 12.0s |
| Architecture | 100% | 90% | 11.1s |
| Algorithm | 100% | 95% | 10.0s |

**Overall: 100% success rate with 92% average confidence**

## 🔑 Configuration

### API Keys

Set your API keys as environment variables:

```bash
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-ant-..."
# Optional providers
export GOOGLE_API_KEY="..."
export MISTRAL_API_KEY="..."
export GROQ_API_KEY="..."
```

Or create `.env` file:

```env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_API_KEY=...
MISTRAL_API_KEY=...
```

### Model Selection

Configure your preferred models:

```bash
# Use specific models
ai-solve "Fix bug" --primary claude-3.5-sonnet --secondary gpt-4o-mini

# Use presets
ai-solve "Optimize code" --preset performance  # Uses Claude + GPT-4o
ai-solve "Quick fix" --preset speed            # Uses Haiku + GPT-4o-mini
ai-solve "Complex problem" --preset accuracy   # Uses Claude + Gemini Pro
```

Available models include:
- **Claude**: 3.5 Sonnet, 3 Opus, 3 Haiku
- **OpenAI**: GPT-4o, GPT-4o-mini, GPT-4-Turbo
- **Google**: Gemini 1.5 Pro, Gemini 1.5 Flash
- **Meta**: Llama 3.1 (70B, 405B)
- **Others**: DeepSeek, Mixtral, Command R+, Qwen

See [MODELS.md](MODELS.md) for complete model comparison and pricing.

## 🏗️ Architecture

```
dual-ai-tools/
├── src/
│   ├── core/
│   │   ├── dual-ai-solver.ts    # Main orchestrator
│   │   ├── ai-consultant.ts     # Consultation logic
│   │   └── confidence-scorer.ts # Scoring algorithm
│   ├── providers/
│   │   ├── claude.ts            # Claude integration
│   │   └── gpt.ts               # GPT integration
│   └── cli/
│       ├── solve.ts             # CLI for solving
│       └── consult.ts           # CLI for consulting
├── test/
│   └── test-suite.ts            # Comprehensive tests
└── dist/                        # Compiled output
```

## 🤝 Contributing

We welcome contributions! The system is modular and can be extended with:

- Additional AI providers (Gemini, Mistral, etc.)
- New problem categories
- Enhanced confidence scoring algorithms
- UI/UX improvements

## 📊 Cost Analysis

Average cost per problem solved:
- Simple problems (1-2 iterations): ~$0.05
- Medium complexity (3-4 iterations): ~$0.15
- Complex problems (5 iterations): ~$0.30

Compare to developer time: If it saves 30 minutes of debugging, that's worth it!

## 🐛 Troubleshooting

### "API Key not found"
```bash
# Check your environment
echo $OPENAI_API_KEY
echo $ANTHROPIC_API_KEY

# Set them if missing
export OPENAI_API_KEY="your-key"
export ANTHROPIC_API_KEY="your-key"
```

### "Confidence always below 88%"
This means both AIs aren't confident in any solution. Consider:
- Breaking the problem into smaller parts
- Providing more context
- Checking if the problem is well-defined

### "Timeout errors"
Default timeout is 60s per iteration. For complex problems:
```bash
ai-solve "complex problem" --timeout 120
```

## 📜 License

MIT © 2024

## 🙏 Acknowledgments

Built with:
- OpenAI GPT-4 API
- Anthropic Claude API
- Inspired by ensemble learning and cross-validation techniques

---

**Remember**: This tool doesn't replace thinking - it augments it. Always review solutions before implementing!

🌟 If this saves you debugging time, please star the repo!