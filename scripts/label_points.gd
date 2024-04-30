extends Label

const POINTS_LABEL = "%d Points"

func show_points(points):
	self.text = POINTS_LABEL % points
