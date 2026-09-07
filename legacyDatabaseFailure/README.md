# Legacy Database Failure Response: Workflow Mapping and Schema Redesign Support

**Status:** Completed
**Type:** Operational analysis / process mapping / database redesign support
**Context:** Municipal administrative operations
**Author:** Fábio Figueiredo

---

## Executive Summary

When a migration from 32-bit to 64-bit architecture broke a mission-critical, un-documented Microsoft Access database, operational tracking ground to a halt. Local permission locks prevented immediate rollbacks, exposing a deep communication gap between IT support and daily operations.

I stepped in to translate tacit operational knowledge into structured technical specifications. By reverse-engineering the system under pressure, I produced current-state/future-state database entity models and process workflow maps. While the full cloud rebuild proposal was shelved by leadership, the process maps and schema artifacts became the organization's official operational reference standard for years following the incident.

---

### Tech & Tooling

* **Database Modeling:** MS Access Schema Analysis, Entity-Relationship Mapping
* **Process Mapping:** Workflow Diagraming, Dependency Analysis, Bottleneck Identification
* **Stakeholder Bridge:** Business to IT translation, Technical Documentation

---

### The Operational Breakdown

#### 1. The Immediate Trigger

* Enviromnent upgrade to 64-bit architecture broke legacy Access VBA/macros.
* Strict IT machine permissions blocked local software reinstalls or direct user-level workarounds.
* Operational tracking stopped for several days, creating severe backlog in case logging.

#### 2. The Core Structural Problem

* **Zero Documentation:** The database had become business-critical without updated process docs or schema references.
* **The IT/Ops gap:** IT understood the software failure but had zero visibility into underlying business rules, legal dependencies or daily operational steps

---

### Key Deliverables & Role

I reversed engineered the divisions undocumented workflows to build two core tech artifacts:

1. **Dual operational Workflow Maps:** Visualized the real-world sequence, handoff, and dependencies for the division's two distinct process types.
2. **Current vs Future-State Schema Models:** Modeled the existing Access relational structure alongside a proposed, normalized schema designed form migration to a modern database environment.

---

### Business Impact & Lasting Value

* **Operational Continuity:** Provided IT with the exact requirements needed to restore basic operational capacities.
* **Durable Reference Artifacts:** Although higher management opted not to deploy the full database redesign, the workflow maps and graphical data models were formally adopted  and remain in operational use.
* **Risk reduction:** Eliminated single point of failure reliance in tacit employee memorie during system disruptions

---

### Key Takeaways

> *"Legacy systems fail hardest when business logic lives only in people's heads. Translating tacit process knowledge into durable visual models is the prerequisite for for any sucessful system recovery or redesign."*

* **Upstream analytical impact:** High value data work often happens *before* a database is build or dashboard drawn, in the domain modeling and process architecture phase.
* **Pragmatic Documentation:** Even when technical proposals are shelved by org constraints, clean process documentation creates immediate, long-term operational value.
