extends Label

const LIVES_LABEL = "%d Lives"

func show_lives(lives):
	self.text = LIVES_LABEL % lives
