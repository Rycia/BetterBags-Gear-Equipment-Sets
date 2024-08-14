name: "Bug Report"
description: Report a bug or an issue with BetterBags Gear/Equipment Sets.
title: "[ISSUE] - "
labels: "Bug"
body:
  - type: markdown
    attributes:
      value: |
        Please [search for existing issues](https://github.com/Rycia/BetterBags-Gear-Equipment-Sets/issues) before creating a new one.

  - type: textarea
    attributes:
      label: Description
      description: What did you expect to happen, and what happened instead?
    validations:
      required: true

  - type: checkboxes
    id: testing
    attributes:
      label: Tested with only BetterBags Gear/Equipment Sets
      description: Did you try having APR as the only enabled addon and everything else (especially something like ElvUI) disabled?
      options:
        - label: "Yes"
        - label: "No"

  - type: textarea
    attributes:
      label: Lua Error
      description: |
        Do you have an error? If you don't see any errors, make sure that you install BOTH [BugSack](https://www.curseforge.com/wow/addons/bugsack) & [BugGrabber](https://www.curseforge.com/wow/addons/bug-grabber).
    validations:
      required: false

  - type: textarea
    attributes:
      label: Reproduction
      description: Please list out the steps to reproduce your bug. Please verify that your reproduction steps are enough to reproduce the problem.
    validations:
      required: true

  - type: textarea
    attributes:
      label: Screenshots
      description: If applicable, add screenshots to help explain your problem.
      placeholder: Attach directly via "copy & paste," do not link to other sites
    validations:
      required: false

  - type: textarea
    attributes:
      label: Any additional information?
      description: |
        If you have additional information that does not belong in the other fields, include that here.
    validations:
      required: false