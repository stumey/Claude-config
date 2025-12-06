# Claude Code Global Configuration

This repository contains my global Claude Code configuration including custom subagents and skills for professional software development across C#/.NET, Node.js, DevOps, Kubernetes, Terraform, and CI/CD workflows.

## Contents

- **18 Production-Ready Subagents** - Specialized AI agents for different technologies and tasks
- **11 Professional Skills** - Reusable expertise modules that agents can leverage
- **Global Settings** - Claude Code configuration preferences

## Technology Stack Coverage

### Languages & Frameworks
- **C# / .NET** - Modern .NET 8+ and legacy .NET Framework 4.8
- **JavaScript / TypeScript** - ES2023+, Node.js, TypeScript

### Infrastructure & DevOps
- **Kubernetes** - Container orchestration, GitOps, service mesh, multi-cloud (EKS/AKS/GKE)
- **Terraform** - Infrastructure as Code, state management, multi-cloud deployments
- **Docker** - Containerization and optimization
- **CI/CD** - GitHub Actions, deployment pipelines

### Architecture & Operations
- **Cloud Architecture** - AWS, Azure, GCP, hybrid cloud
- **Platform Engineering** - Developer platforms and self-service infrastructure
- **SRE** - Site Reliability Engineering practices
- **DevOps** - End-to-end DevOps workflows and troubleshooting

## Subagents (18)

### C# / .NET (2)
- `csharp-expert` - Modern C# 12 & .NET 8+ (ASP.NET Core, Blazor, microservices, cloud-native)
- `dotnet-framework-4.8-expert` - Legacy .NET Framework 4.8 (Web Forms, WCF, Windows Services)

### JavaScript / TypeScript / Node.js (3)
- `javascript-pro` - Modern JavaScript ES2023+ development
- `typescript-pro` - TypeScript expert with advanced type system usage
- `nodejs-expert` - Node.js specialist for backend development

### Infrastructure as Code (2)
- `kubernetes-expert` - **Comprehensive** Kubernetes expert (GitOps, service mesh, multi-cloud, security)
- `terraform-expert` - **Comprehensive** Terraform/OpenTofu expert (state management, multi-cloud, enterprise patterns)

### CI/CD (1)
- `github-actions-expert` - GitHub Actions specialist for automation workflows

### Cloud & DevOps (10)
- `cloud-architect` - Multi-cloud architecture and design
- `hybrid-cloud-architect` - Hybrid cloud connectivity and integration
- `devops-engineer` - General DevOps engineering and automation
- `devops-troubleshooter` - Advanced DevOps debugging and incident response
- `deployment-engineer` - Deployment strategies and automation
- `platform-engineer` - Internal developer platforms and self-service
- `sre-engineer` - Site Reliability Engineering and operational excellence
- `docker-expert` - Docker containerization and optimization
- `network-engineer` - Cloud networking and connectivity

## Skills (11)

### Kubernetes Skills (4)
- `gitops-workflow` - ArgoCD/Flux GitOps patterns and workflows
- `helm-chart-scaffolding` - Helm chart templates and best practices
- `k8s-manifest-generator` - Kubernetes manifest generation
- `k8s-security-policies` - Kubernetes security standards and policies

### Terraform Skills (1)
- `terraform-module-library` - Reusable Terraform modules for AWS/Azure/GCP

### CI/CD Skills (3)
- `deployment-pipeline-design` - Multi-stage CI/CD pipeline patterns
- `github-actions-templates` - Production-ready GitHub Actions workflows
- `secrets-management` - Secure secrets management for pipelines

### Cloud Infrastructure Skills (3)
- `cost-optimization` - Cloud cost optimization strategies
- `hybrid-cloud-networking` - Hybrid cloud connectivity patterns
- `multi-cloud-architecture` - Multi-cloud architecture decision frameworks

## Installation

### Quick Install (One Command)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/claude-config/main/install.sh)"
```

### Manual Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/claude-config.git
   cd claude-config
   ```

2. **Run the installation script:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

   Or manually copy files:
   ```bash
   # Copy agents
   cp -r agents/* ~/.claude/agents/

   # Copy skills
   cp -r skills/* ~/.claude/skills/

   # Copy settings (optional - merges with existing)
   cp settings.json ~/.claude/settings.json
   ```

3. **Verify installation:**
   ```bash
   ls -la ~/.claude/agents/
   ls -la ~/.claude/skills/
   ```

## Usage

### Using Subagents

**List available agents:**
```
/agents
```

**Explicit invocation:**
Claude automatically delegates to the best expert for your task, or you can explicitly request:
```
"Use the kubernetes-expert to design a multi-cluster architecture"
"Have the terraform-expert create AWS VPC modules"
"Ask the csharp-expert to optimize this API performance"
```

### Using Skills

Skills are **automatically discovered** based on context:
- Working with Helm charts → `helm-chart-scaffolding` activates
- Designing pipelines → `deployment-pipeline-design` loads
- Managing secrets → `secrets-management` becomes available
- Building Terraform modules → `terraform-module-library` provides templates

You can also explicitly invoke skills:
```
/skills
```

## Key Features

### Consolidated Experts
Each technology has **one comprehensive expert** combining best practices from multiple sources:
- **kubernetes-expert** - Consolidated from 4 agents (covers basic to GitOps/service mesh)
- **terraform-expert** - Consolidated from 3 agents (covers basic to enterprise IaC)
- **csharp-expert** - Consolidated from 3 agents (covers modern .NET 8+)

### Production-Ready
- Enterprise-grade patterns and best practices
- Security-first approach
- Performance optimization focus
- Comprehensive error handling
- Full testing coverage guidance

### Cross-Platform
- Multi-cloud support (AWS, Azure, GCP)
- Cross-platform .NET development
- Kubernetes across all providers (EKS, AKS, GKE, on-prem)
- Hybrid cloud architectures

## Customization

### Adding Your Own Agents

1. Create a new `.md` file in `agents/` directory
2. Add YAML frontmatter with metadata:
   ```yaml
   ---
   name: my-custom-agent
   description: What this agent does and when to use it
   tools: Read, Write, Edit, Bash, Glob, Grep
   model: sonnet
   ---
   ```
3. Write agent instructions below the frontmatter
4. Install: `cp agents/my-custom-agent.md ~/.claude/agents/`

### Adding Your Own Skills

1. Create a directory in `skills/` with a `SKILL.md` file
2. Add YAML frontmatter and instructions
3. Install: `cp -r skills/my-skill ~/.claude/skills/`

## Updating

To get the latest agents and skills from this repo:

```bash
cd claude-config
git pull origin main
./install.sh
```

## Backup Your Customizations

If you've customized agents locally:

```bash
# Backup your current config
cp -r ~/.claude/agents ~/claude-backup-agents
cp -r ~/.claude/skills ~/claude-backup-skills

# After installation, restore your customizations
cp ~/claude-backup-agents/my-custom-agent.md ~/.claude/agents/
```

## Repository Structure

```
claude-config/
├── README.md                      # This file
├── install.sh                     # Installation script
├── .gitignore                     # Git ignore rules
├── settings.json                  # Global Claude settings
├── agents/                        # Subagents directory
│   ├── csharp-expert.md
│   ├── kubernetes-expert.md
│   ├── terraform-expert.md
│   └── ... (18 total)
└── skills/                        # Skills directory
    ├── gitops-workflow/
    ├── helm-chart-scaffolding/
    ├── k8s-manifest-generator/
    └── ... (12 total)
```

## Sources

This configuration was curated from the following community repositories:

- [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents)
- [wshobson/agents](https://github.com/wshobson/agents)
- [travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)
- [0xfurai/claude-code-subagents](https://github.com/0xfurai/claude-code-subagents)

## Contributing

Feel free to submit PRs with:
- New agents for additional technologies
- Enhanced skills with more patterns
- Improvements to existing agents
- Bug fixes or documentation updates
