-- define TemplateProject_example_script() for use as an event handler
function TemplateProject_example_script(event, ...)
  echo("Received event " .. event .. " with arguments:\n")
  display(...)
end
