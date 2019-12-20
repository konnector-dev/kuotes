<?php
declare(strict_types=1);

use Migrations\AbstractMigration;

class CreateKuotes extends AbstractMigration
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
        $table = $this->table('kuotes');
        $table->addColumn('author_id', 'integer', [
            'default' => null,
            'limit' => 11,
            'null' => false,
        ]);
        $table->addColumn('kuote', 'text', [
            'default' => null,
            'null' => false,
        ]);
        $table->addColumn('added_at', 'datetime', [
            'default' => null,
            'null' => true,
        ]);
        $table->addColumn('status', 'integer', [
            'default' => 0,
            'limit' => 11,
            'null' => true,
        ]);
        $table->addColumn('deleted_at', 'datetime', [
            'default' => null,
            'null' => true,
        ]);
        $table->addColumn('is_owner', 'boolean', [
            'default' => 0,
            'null' => true,
        ]);
        $table->addColumn('photo', 'string', [
            'default' => null,
            'limit' => 255,
            'null' => true,
        ]);
        $table->addColumn('created', 'datetime', [
            'default' => null,
            'null' => true,
        ]);
        $table->create();
    }
}
