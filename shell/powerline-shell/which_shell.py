from powerline_shell.utils import BasicSegment, warn
import os


class Segment(BasicSegment):
    def add_to_powerline(self):
        # See discussion in https://github.com/banga/powerline-shell/pull/204
        # regarding the directory where battery info is saved
        self.powerline.append(os.getenv('SHELL').split('/')[-1],
            self.segment_def.get("fg_color", self.powerline.theme.PATH_FG),
            self.segment_def.get("fg_color", self.powerline.theme.PATH_BG))
