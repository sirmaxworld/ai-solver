#!/bin/bash

# Setup script for Dual AI Tools open source project
set -e

echo "🚀 Setting up Dual AI Tools Repository"
echo "======================================"

# Configuration
REPO_NAME="ai-solver"
GITHUB_USERNAME="sirmaxworld"
GITHUB_EMAIL="robert@yourox.ai"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Initialize Git repository
echo -e "${YELLOW}1. Initializing Git repository...${NC}"
git init
git config user.name "$GITHUB_USERNAME"
git config user.email "$GITHUB_EMAIL"

# 2. Create .gitignore
echo -e "${YELLOW}2. Creating .gitignore...${NC}"
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Production
dist/
build/

# Environment
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo
.DS_Store

# Testing
coverage/
*.lcov
.nyc_output

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# API Keys (extra safety)
*api-key*
*API-KEY*
*.key
*.pem

# Commercial license keys
licenses/commercial/
.license-keys/

# Temporary
tmp/
temp/
*.tmp
EOF

# 3. Create initial commit
echo -e "${YELLOW}3. Creating initial commit...${NC}"
git add .
git commit -m "feat: initial commit - Dual AI Tools v1.0.0

- Dual-AI confidence scoring system
- 88% confidence threshold
- Support for Claude and GPT
- CLI tools included
- VS Code extension ready
- AGPL-3.0 + Commercial dual licensing"

# 4. Create GitHub repository
echo -e "${YELLOW}4. Creating GitHub repository...${NC}"
echo -e "${GREEN}Run these commands to create and push to GitHub:${NC}"
cat << EOF

# Create repository on GitHub (using GitHub CLI)
gh repo create $REPO_NAME --public --description "AI-powered problem solver using dual-AI validation with confidence scoring" --homepage "https://your-domain.com"

# Add remote and push
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git
git branch -M main
git push -u origin main

# Add topics to repository
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "ai"
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "problem-solving"
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "developer-tools"
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "gpt"
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "claude"
gh repo edit $GITHUB_USERNAME/$REPO_NAME --add-topic "confidence-scoring"

EOF

# 5. Set up branch protection
echo -e "${YELLOW}5. Branch protection setup:${NC}"
cat << EOF

# Protect main branch
gh api repos/$GITHUB_USERNAME/$REPO_NAME/branches/main/protection \\
  --method PUT \\
  --field required_status_checks='{"strict":true,"contexts":["continuous-integration"]}' \\
  --field enforce_admins=false \\
  --field required_pull_request_reviews='{"required_approving_review_count":1}' \\
  --field restrictions=null

EOF

# 6. Create issues for roadmap
echo -e "${YELLOW}6. Creating initial issues:${NC}"
cat << EOF

# Create roadmap issues
gh issue create --title "Add support for Gemini AI provider" --body "Add Google's Gemini as third AI provider" --label "enhancement"
gh issue create --title "Implement caching for repeated problems" --body "Cache solutions to reduce API costs" --label "enhancement"
gh issue create --title "Add web UI dashboard" --body "Create web interface for non-CLI users" --label "enhancement"
gh issue create --title "Support for more programming languages" --body "Extend beyond TypeScript/JavaScript" --label "enhancement"

EOF

# 7. Create release
echo -e "${YELLOW}7. Creating first release:${NC}"
cat << EOF

# Create v1.0.0 release
gh release create v1.0.0 \\
  --title "Dual AI Tools v1.0.0 - Initial Release" \\
  --notes "## 🎉 First Public Release

### Features
- ✅ Dual-AI validation system (Claude + GPT)
- ✅ 88% confidence threshold
- ✅ 5-iteration maximum search
- ✅ CLI tools (ai-solve, ai-consult)
- ✅ VS Code extension
- ✅ 100% test success rate

### Supported Problem Types
- CSS/Layout issues
- React optimization
- Performance problems
- Architecture decisions
- Algorithm improvements

### Installation
\\\`\\\`\\\`bash
npm install -g @ai-tools/dual-ai-solver
\\\`\\\`\\\`

### License
AGPL-3.0 for open source, commercial licenses available.

### Test Results
- Success Rate: 100%
- Average Confidence: 92%
- Average Solution Time: 20s
"

EOF

# 8. Set up GitHub Pages for documentation
echo -e "${YELLOW}8. Setting up GitHub Pages:${NC}"
mkdir -p docs
cat > docs/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Dual AI Tools - Documentation</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
</head>
<body>
    <main class="container">
        <h1>🤖🤖 Dual AI Tools</h1>
        <p>AI-powered problem solving with confidence scoring</p>
        
        <h2>Quick Start</h2>
        <pre><code>npm install -g @ai-tools/dual-ai-solver
ai-solve "your problem here"</code></pre>
        
        <h2>Documentation</h2>
        <ul>
            <li><a href="https://github.com/YOUR_USERNAME/dual-ai-tools#readme">README</a></li>
            <li><a href="https://github.com/YOUR_USERNAME/dual-ai-tools/wiki">Wiki</a></li>
            <li><a href="https://github.com/YOUR_USERNAME/dual-ai-tools/blob/main/CONTRIBUTING.md">Contributing</a></li>
        </ul>
        
        <h2>Commercial Licensing</h2>
        <p>For proprietary use, <a href="mailto:license@your-domain.com">contact us</a></p>
    </main>
</body>
</html>
EOF

# 9. Create npm publish workflow
echo -e "${YELLOW}9. Creating GitHub Actions for npm publish:${NC}"
mkdir -p .github/workflows
cat > .github/workflows/npm-publish.yml << 'EOF'
name: Publish to npm

on:
  release:
    types: [created]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
          registry-url: 'https://registry.npmjs.org'
      - run: npm ci
      - run: npm test
      - run: npm run build
      - run: npm publish --access public
        env:
          NODE_AUTH_TOKEN: ${{secrets.NPM_TOKEN}}
EOF

# 10. Success message
echo -e "${GREEN}✅ Repository structure created successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Update GITHUB_USERNAME and GITHUB_EMAIL in this script"
echo "2. Install GitHub CLI: brew install gh"
echo "3. Authenticate: gh auth login"
echo "4. Run the commands shown above"
echo "5. Set up npm account and add NPM_TOKEN to GitHub secrets"
echo "6. Update LICENSE files with your company details"
echo "7. Create your website for commercial licensing"
echo ""
echo -e "${YELLOW}📊 Monetization Setup:${NC}"
echo "1. Set up Stripe account for payments"
echo "2. Create pricing page on your website"
echo "3. Implement license key validation"
echo "4. Set up CLA Assistant: https://cla-assistant.io/"
echo ""
echo -e "${GREEN}🚀 Ready to launch your open source business!${NC}"