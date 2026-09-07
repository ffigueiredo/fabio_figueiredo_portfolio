# Legacy Database Failure Response: Workflow Mapping and Schema Redesign Support

**Status:** Completed
**Type:** Operational analysis / process mapping / database redesign support
**Context:** Municipal administrative operations
**Author:** Fábio Figueiredo

## Overview

This project documents a response to a legacy Microsoft Access database failure that disrupted internal operational tracking.
Following the transition from 32-bit to 64-bit architecture, the original database could no longer be used as expected.
At the same time, local permission restrictions prevented reinstalling older software or applying direct workarounds on user machines.

As a result, the team spent several days without being able to log internal movement correctly, creating operational disorder and exposing a broader structural issue: the process logic was poorly documented, and IT did not have a clear understanding of the underlying business workflow.

My role was to help translate the operational reality into something legible and usable for technical discussion. To do that, I produced two main outputs:

1. Workflow maps for the two distinct operational product/process types handled by the division
2. A graphical model of the current database structure and a proposed future-state structure to support redesign discussions with IT

## Problem

The immediate issue was the loss of operational continuity after the original Access-based solution became unusable in the new architecture environment.
The deeper issue was that the system had become business-critical without sufficiently up-to-date process documentation, data structure documentation, or a shared understanding between operations and IT. This made recovery and redesign slower and more dependent on tacit knowledge.

## Context

Before the failure, I had already raised concerns about the fragility of the legacy setup and had suggested migration of the existing database to an Azure cloud environment alongside development of a more sustainable interface. That migration did not happen before the disruption.

When the failure occurred, the absence of documented workflows and current data structure references became a practical bottleneck. IT support needed to understand not just the software problem, but the actual business process the database was meant to support.

## My role

I was tasked with producing materials that could make the division’s work understandable to people outside the operational team.

This involved:

- Mapping the workflow for the two main process/product types
- Identifying the information and functional requirements the database needed to support
- Translating those requirements into a graphical model of the current and proposed database structure
- Presenting these materials as support for a rebuild / redesign discussion

## Outputs

### 1. Workflow mapping

I created current-state workflow maps for the two distinct operational product types handled by the division.
These maps were designed to:

- Explain the real sequence of work
- Clarify steps, dependencies, and handoffs
- Give technical stakeholders a usable view of the operational logic
- Reduce ambiguity during discussions about system redesign

These workflow maps are still in use several years later.

### 2. Database structure modeling

To avoid relying only on verbal explanation, I documented:

- The structure of the existing database
- A proposed structure for a future version better aligned with operational needs

The goal was to provide a visual and structural explanation of how the system currently worked, where its limitations were, and what a more sustainable design could look like.
Although the redesign proposal itself was not adopted, the graphical model remained useful in practice and has continued to support faster process lookup and information retrieval.

## Outcome

The full redesign was not implemented, but the project produced durable operational artifacts.
The workflow maps continued to be used years later as reference material. The graphical data model also remained useful beyond the original incident, particularly as a practical aid for locating processes and accelerating information gathering.

## Why this matters

This project is a good example of analytical support work that sits upstream of formal reporting or dashboarding.

The value here was not in producing a dataset or statistical output. The value was in making an undocumented operational system understandable under pressure, translating business logic into structured artifacts, and creating materials that supported both continuity and future redesign.

## Limitations

- Source files may be simplified, anonymized, or recreated for confidentiality reasons
- The redesign proposal was not fully implemented, so this repository documents the analysis and design-support work rather than a deployed system
- Some organizational decisions affecting the final outcome were outside my control

## Key takeaways

- Legacy systems fail harder when business logic is undocumented
- Process knowledge needs to be translated into durable artifacts before redesign can succeed
- Visual models are often more effective than purely verbal explanation when bridging operations and IT
- Even when a redesign is not implemented, clear process and structure documentation can continue to create operational value
