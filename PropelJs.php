<?php
declare(encoding = "UTF8");
namespace PropelJs;
/**
 * So lets see... this will be able to handle propel-classes/objects
 * and get instructions as to how to do this from a js-file on the
 * client.
 *
 *
 * User: Henrik Pejer mr@henrikpejer.com
 * Date: 2013-03-16 19:07
 */
class PropelJs {

    protected $commands = NULL;
    protected $class = NULL;
    protected $propelObject = NULL;

    public function __construct($class, $commands = NULL) {
        $this->class    = $class;
        $this->commands = $commands;
    }

    public function run() {
        $this->propelObject = $this->loadPropelForClass();
        foreach ($this->commands as $command) {

            $this->propelObject = call_user_func_array(array($this->propelObject, $command->command), $command->args);
        }
        return $this->propelObject;
    }

    private function loadPropelForClass() {
        return call_user_func($this->class.'::create');
    }
}