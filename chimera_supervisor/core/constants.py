
import os

from chimera.core.constants import SYSTEM_CONFIG_DIRECTORY

DEFAULT_ROBOBS_DATABASE = os.path.join(
    SYSTEM_CONFIG_DIRECTORY, 'robo_scheduler.db')

DEFAULT_ROBOBS_DATABASE_CONFIG = os.path.join(
    SYSTEM_CONFIG_DIRECTORY, 'robo_scheduler.yaml')

DEFAULT_PROGRAM_DATABASE = os.path.join(
    SYSTEM_CONFIG_DIRECTORY, 'manager_checklist.db')

DEFAULT_STATUS_DATABASE = os.path.join(
    SYSTEM_CONFIG_DIRECTORY, 'manager_status.db')