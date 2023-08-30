local Translations = {
    error = {
      you_dont_have_the_required_items = "You don\'t have the required items!",
    },
    success = {
      crafting_finished = 'crafting finished',
    },
    primary = {

    },
    progressbar = {
      crafting_a = 'Crafting a ',
    },
    label = {
      open_crafting_menu = 'Open Crafting Menu'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
