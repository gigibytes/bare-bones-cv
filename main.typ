#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#show link: set text(blue)

#show heading: h => [
  #set text(
    size: eval(settings.font.size.heading_large),
    font: settings.font.display
  )
  #h
]

#let sidebarSection = {[
  #par(justify: true)[

    #par[
      #set text(
        size: eval(settings.font.size.contacts),
        font: settings.font.basic,
      )
      
      Email: #link("mailto:" + configuration.contacts.email) \
      Phone: #link("tel:" + configuration.contacts.phone) \
      LinkedIn: #link(configuration.contacts.linkedin)[janedoe] \
      GitHub: #link(configuration.contacts.github)[janedoe] \
      
      #configuration.contacts.address
    ]
    #line(length: 100%)
  ]
  
  = Skills

  #{
    for skill in configuration.skills [
      #par[
        #set text(
          size: eval(settings.font.size.description),
        )
        #set text(
          // size: eval(settings.font.size.tags),
          font: settings.font.display,
        )
        *#skill.name* 
        #linebreak()
        #set text(
          // size: eval(settings.font.size.tags),
          font: settings.font.basic,
        )
        #skill.items.join(" • ")
      ]
    ]
  }

  = Education

  #{
    for place in configuration.education [
        #par[
          #set text(
            size: eval(settings.font.size.heading),
            font: settings.font.display
          )
            #place.from – #place.to \
            #link(place.university.link)[#place.university.name]
        ]
        #par[
          #set text(
            eval(settings.font.size.education_description),
            font: settings.font.basic,
          )
          #place.degree #place.major \
          #place.track track
        ]
    ]
  }

]}

#let mainSection = {[

  // #par[
  //   #set align(center)
  //   #figure(
  //     image("images/Kodak 20 Zanvoort Lumi.jpg", width: 6em),
  //     placement: top,
  //   )
  // ]

  #par[
    #set text(
      size: eval(settings.font.size.heading_huge),
      font: settings.font.display,
    )
    *#configuration.contacts.name* | #configuration.contacts.title
  ]
  
  #par[
    #set text(
        eval(settings.font.size.education_description),
        font: settings.font.basic,
    )
    An experienced *software engineer*, open to roles ranging from *software engineering* to *DevOps/SRE*.
  ]
  
  = Experience

  #{
    for job in configuration.jobs [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.display
        )
          
          *#job.position*
          #link(job.company.link)[\@  #job.company.name] | #job.from – #job.to
      ]
      #par(
        justify: false,
        leading: eval(settings.paragraph.leading)
      )[
        #set text(
          size: eval(settings.font.size.description),
          font: settings.font.basic
        )
        #{
          for point in job.description [
            #h(0.5cm) • #point \
          ]
        }
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.basic
        )
        #{
          let tag_line = job.tags.join(" • ")
          tag_line
        }
      ]
    ]
  }



  = Projects

  #{
    for proj in configuration.projects [
      #par(justify: false)[
        #set text(
          size: eval(settings.font.size.heading),
          font: settings.font.display
        )        
          *#link(proj.project.link)[#proj.project.name]*   
      ]
      #par(
        justify: true,
        leading: eval(settings.paragraph.leading)
      )[
        #par[
          #set text(
            size: eval(settings.font.size.description),
            font: settings.font.basic
          )
          #proj.description
        ]
        #par(
        justify: true,
        leading: eval(settings.paragraph.leading),
      )[
        #set text(
          size: eval(settings.font.size.tags),
          font: settings.font.basic
        )
        #{
          let tag_line = proj.tags.join(" • ")
          tag_line
        }
      ]
      ]
    ]
  }
]}

#{
  grid(
    columns: (2fr, 5fr),
    column-gutter: 2em,
    sidebarSection,
    mainSection,
  )
}