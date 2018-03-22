chimera-supervisor plugin
=========================

This is a plugin for the chimera observatory control system https://github.com/astroufsc/chimera. It provides a
"observatory supervisor" controller. A supervisor is responsible for autonomously controlling the observatory. Its tasks
includes, but are not limited to, schedule a queue for the night, check the weather conditions and allow the telescope
to open or close under certain limits and send logging information to human watchers.

This module is extremely flexible. The user sets up a checklist, each item in the list has a series of checking
routines and can have a series of responses. Therefore, it is possible to configure the supervisor to check several
different actions on several different conditions and answer with a set of responses.

It also implements a Telegram bot, responsible for broadcasting messages from the module. User can also be queried
 to answer to specific actions.

Robobs example
--------------

To add a new project::

    chimera-robobs --addProject -f recurrent_example_proj.yaml


To delete a project::

    chimera-robobs --deleteProject --pid TEST

To add targets::

    chimera-robobs --addTargets -f recurrent_example_targets.csv

To add an observing block for a target and project::

    chimera-robobs --addObservingBlock -f recurrent_example_block.yaml --target WXCen --pid TEST

To remove ALL observing blocks::

    chimera-robobs --cleanObservingBlock

To remove all observing blocks for a specific project::

    chimera-robobs --deleteObservingBlock --pid TEST


or for all objects in the testfile::

    for i in `cut -f 2 -d, recurrent_example_targets.csv | grep -v NAME`;
    do
        chimera-robobs --addObservingBlock -f recurrent_example_block.yaml --target $i --pid TEST --block first_block
    done

To make a night queue, we first clean the queue::

    chimera-robobs --cleanQ --pid TEST

then, calculate it::

    chimera-robobs --makeQ --pid TEST --pid-conf recurrent_pid.conf

Once calculated, one can simulate the night with::

    chimera-robobs --cleanObservingLog
    chimera-robobs --proc  # Proccesses the queue
    chimera-robobs --makeO --sim  # Simulates it.

Usage
-----

This controller uses a da

Installation
------------

Installation instructions. Dependencies, etc...

::

   pip install -U chimera_supervisor

or

::

    pip install -U git+https://github.com/astroufsc/chimera-supervisor.git


Configuration Example
---------------------

Here goes an example of the configuration to be added on ``chimera.config`` file.

::

    controller:
        type: Supervisor
        name: MyObservatoryManager
        freq: 0.025
        telegram-token: some-telegram-bot-token
        telegram-broascast-ids: user or group chat id
        telegram-listen-ids: user or group chat id
        telescope: /FakeTelescope/fake
        camera: /FakeCamera/fakeT80Cam
        dome: /FakeDome/fake
        weatherstations: /FakeWeatherStation/fake1,/FakeWeatherStation/fake2
        scheduler: /Scheduler/fake
        robobs: /RobObs/fake


Supervisor Configuration Example
--------------------------------

This is how you setup an action. Drop this to an yaml file and load it with the chimera-supervisor script.

::

    checklist:
      - name: Test3
        eager: False
        active: False
        check:
          - type: CheckInstrumentFlag
            instrument: telescope
            mode: 1
            flag: READY
        responses:
          - type: SendPhoto
            path: /Users/tiago/Downloads/filters_response.png
            message: This is a test...


Contact
-------

For more information, contact us on chimera's discussion list:
https://groups.google.com/forum/#!forum/chimera-discuss

Bug reports and patches are welcome and can be sent over our GitHub page:
https://github.com/astroufsc/chimera-manager/
