<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

class CreateUserLogins extends AbstractMigration
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
        $table = $this->table('user_logins');
        $table->addColumn('user_id', 'string', [
            'default' => null,
            'limit' => 255,
            'null' => false,
        ]);
        $table->addColumn('login_status', 'boolean', [
            'default' => false,
            'null' => true,
        ]);
        $table->addColumn('attempts', 'integer', [
            'default' => 0,
            'limit' => 11,
            'null' => true,
        ]);
        $table->addColumn('ip_address', 'string', [
            'default' => '127.0.0.1',
            'limit' => 255,
            'null' => true,
        ]);
        $table->addColumn('browser_meta', 'text', [
            'default' => null,
            'null' => true,
        ]);
        $table->addColumn('created', 'datetime', [
            'default' => null,
            'null' => true,
        ]);
        $table->create();
    }
}
