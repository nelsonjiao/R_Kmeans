shinyUI(pageWithSidebar(
  headerPanel('Sales Data K-Means Model'),
  sidebarPanel(),
  mainPanel(
    plotOutput('plot1')
  )
))