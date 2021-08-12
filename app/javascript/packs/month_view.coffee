class MonthView

    # COFFEE SCRIPT EXAMPLE
    #
    #
    # TODO: muss komplett neu gemacht werden.
    # on scroll darf nur gebunden werden wenn PostIndex aufgerufen wird.
    # MonthView sollte nur setActive(month) funktion bereitstellen
    # und das als Instanz Methode, so könnten wir aus allen views
    # window.monthView.setActive('July') aufrufen auch aus der show action
    
    constructor: () ->
        console.log('MonthView.new()')
        @monthViewElement   = document.getElementById('MonthList')
        #@bindClick()

        @PostIndex          = document.getElementById('PostIndex')
        if @PostIndex != undefined
            @bindPostIndexScroll()

    bindPostIndexScroll: ->
        document.addEventListener 'scroll', (e) =>
            @linkFor(@monthFor(window.pageYOffset))

    monthFor: (position) ->
        sections = @PostIndex.getElementsByTagName('section')
        month = (section.id for section in sections when (section.offsetTop + section.offsetHeight) >= position)[0]
        return month
        

    linkFor: (month) ->
        @removeActive()
        links = @monthViewElement.getElementsByTagName('a')
        link = (a for a in links when (a.href.split('#')[1] == month))[0]
        @setActive(link.children[0])

    bindClick: ->
        links = @monthViewElement.getElementsByTagName('a')
        for link in links
            do =>
                link.addEventListener 'click', (event) =>
                    @setActive(event.target)
                return

    setActive: (item) =>
        @removeActive()
        item.classList.add('active')

    removeActive: ->
        lis = @monthViewElement.getElementsByTagName('li')
        for li in lis
            do ->
                li.classList.remove('active')
                return

if window.monthView == undefined
    window.monthView = new MonthView