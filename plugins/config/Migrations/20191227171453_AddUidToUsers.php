<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

class AddUidToUsers extends AbstractMigration
{
    /**
     * Change Method.
     *
     * More information on this method is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-change-method
     * @return void
     */
    public function change()
    {
        $table = $this->table('users');
        $table->addColumn('uid', 'uuid', [
            'default' => null,
            'limit' => 50,
            'null' => true,
        ]);
        $table->addIndex([
            'uid',
        
            ], [
            'name' => 'UID_INDEX',
            'unique' => true,
        ]);
        $table->update();
    }
}
