const transitions = function() {
  this.transition(
    this.fromRoute('main.admin.scores.index'),
    this.toRoute('main.admin.scores.edit'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.scores.index'),
    this.toRoute('main.admin.scores.add'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.musicians.index'),
    this.toRoute('main.admin.musicians.edit'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.fromRoute('main.admin.musicians.index'),
    this.toRoute('main.admin.musicians.add'),
    this.use('toLeft'),
    this.reverse('toRight')
  );

  this.transition(
    this.hasClass('edit-mode-toggle'),
    this.toValue(true),
    this.use('crossFade'),
    this.reverse('crossFade')
  );

};

export default transitions;
