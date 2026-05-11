# no need, I get the gist and have written it down.

I do have a question but more of a mechanical thing, for instance in the ffxiv buff nerf tracker I want to build, should I leverage you to crawl and find the changes from ffxiv website and set them in  a spreadsheet then do the analysis thus demonstrating use of more tools other than what I originally mentioned?

Yes — **absolutely**, but do it for the right reason. Use it to show a full analytical workflow: source collection, structuring, validation, transformation, and analysis. Don’t do it just to pad the tools list.[^1]

For a portfolio, “I built the dataset myself from messy public patch notes” is actually stronger than “I downloaded a clean CSV and made charts,” because it demonstrates the same kind of end-to-end thinking that makes your workflow-audit project valuable.[^2]

## Best use of it

The strong version of this project is:

1. Pull patch-note balance changes from the official FFXIV site.
2. Normalize them into a structured dataset.
3. Store them in a spreadsheet or CSV first.
4. Optionally move them into SQL for querying.
5. Analyze buff/nerf frequency, job volatility, role-level trends, and patch-by-patch change patterns.

That shows data collection, cleaning, schema design, and analysis in one project, which is a much better signal than only showing the final graphs.[^1][^2]

## What to avoid

Don’t make the project read like “look how many tools I used.” Hiring managers care more about whether the tool use was justified than whether the stack is long.[^3]

So yes, add tools beyond what you originally mentioned if they serve the project naturally. If scraping the official site is the cleanest way to build the dataset, then it belongs there. If SQL adds useful analysis and not just ceremony, include it.[^1]

## Good project framing

A strong framing would be:

- Source: official FFXIV patch notes / job-adjustment notes.
- Data collection: extracted balance changes by patch, job, skill, and direction of change.
- Data model: one row per change event.
- Analysis: which jobs get touched most often, which roles are most volatile, whether nerfs cluster around certain patches, and whether some jobs receive more corrective attention over time.

That makes it feel like a real analytical project, not just a fandom spreadsheet. Since your portfolio already includes hobby-linked projects, the key is to keep the structure professional and the question analytical.

## Recommended stack

For this specific project, a clean stack would be:

- **Python** for scraping/parsing
- **CSV/XLSX** for the first structured dataset
- **SQL** for querying and aggregation
- **Python or Power BI** for charts / dashboards

That is a believable and useful toolchain for a junior-to-mid analyst portfolio. It broadens your profile without looking artificial.

## Best portfolio angle

The strongest sentence in the README would not be “used Python, SQL, Excel, scraping, APIs, dashboards.” It would be something like: this project converts unstructured patch-note text into a structured change log for comparative balance analysis across jobs and patches.[^1]

That sentence tells a recruiter you understand the job: take messy inputs, build structure, produce insight. That’s the point.[^2]

## Recommendation

So yes: use me to help crawl, extract, clean, and shape the dataset. Just present it as **methodology**, not magic. Document:

- where the data came from,
- how it was parsed,
- what assumptions you made,
- what edge cases you cleaned manually,
- and what the final schema looks like.

That turns the project from “gaming side project” into “public-text-to-structured-data analysis pipeline,” which is much stronger for the roles you want.

A very clean deliverable would be:

- raw patch note links,
- cleaned spreadsheet/CSV,
- SQL queries,
- a short methodology note,
- final charts,
- README with findings.

That’s portfolio-grade.

<div align="center">⁂</div>

[^1]: https://www.perplexity.ai/search/07fdec19-be52-4d92-9828-b05be577f057

[^2]: https://www.perplexity.ai/search/492805d2-ec90-4b22-a445-359f2b572703

[^3]: https://www.perplexity.ai/search/ed77036b-711e-4674-b4a8-58f2eb643554

